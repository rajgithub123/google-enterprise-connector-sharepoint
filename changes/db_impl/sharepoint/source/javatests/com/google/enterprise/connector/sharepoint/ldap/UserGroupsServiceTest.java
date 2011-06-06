//Copyright 2011 Google Inc.
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.

package com.google.enterprise.connector.sharepoint.ldap;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import com.google.enterprise.connector.sharepoint.TestConfiguration;
import com.google.enterprise.connector.sharepoint.ldap.UserGroupsService.LdapConnection;
import com.google.enterprise.connector.sharepoint.ldap.UserGroupsService.LdapConnectionSettings;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Test class for {@link UserGroupsService}
 *
 * @author nageswara_sura
 */
public class UserGroupsServiceTest {
    private LdapConnectionSettings ldapConnectionSettings;
    private LdapConnection ldapConnection;
    UserGroupsService userGroupsService;

    /**
     * @throws java.lang.Exception
     */
    @Before
    public void setUp() throws Exception {
        this.ldapConnectionSettings = TestConfiguration.getLdapConnetionSettings();
        ldapConnection = new LdapConnection(ldapConnectionSettings);
        this.userGroupsService = new UserGroupsService(ldapConnectionSettings,
                TestConfiguration.cacheSize, TestConfiguration.refreshInterval,
                true);
    }

    /**
     * Test method for
     * {@link com.google.enterprise.connector.sharepoint.ldap.UserGroupsService#getLdapContext()}
     * .
     */
    @Test
    public void testGetLdapContext() {
        this.ldapConnection.getLdapContext();
    }

    /**
     * Test method for
     * {@link com.google.enterprise.connector.sharepoint.ldap.UserGroupsService#getAllParentGroups(java.lang.String, java.util.Set)}
     * .
     */
    @Test
    public void testGetAllParentGroups() {
        Set<String> parentGroups = new HashSet<String>();

        userGroupsService.getAllParentGroups(TestConfiguration.ldapgroupname, parentGroups);
        // including the group it self.
        assertEquals(1, parentGroups.size());
        assertEquals(new Boolean(true), parentGroups.contains(TestConfiguration.google));
        // I&SBU-Web is parent of Google group
        assertEquals(new Boolean(true), parentGroups.contains(TestConfiguration.expectedParentGroup));
        parentGroups = null;
        userGroupsService.getAllParentGroups(TestConfiguration.fakeoremptyldapgroupname, parentGroups);
        assertEquals(null, parentGroups);
    }

    /**
     * Test method for
     * {@link com.google.enterprise.connector.sharepoint.ldap.UserGroupsService#getAllLdapGroups(java.lang.String)}
     * .
     */
    @Test
    public void testGetAllLdapGroups() {
		Set<String> groups = userGroupsService.getAllLdapGroups("u1");
        assertNotNull(groups); // cache for user1
        Set<String> ldapgroups = userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser1);
        assertNotNull(ldapgroups); // cache for user1
        userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser2);
        assertNotNull(groups); // cache for user2
        userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser3);
        assertNotNull(groups); // cache for user3
        userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser4);
        assertNotNull(groups); // cache for user4

        UserGroupsCache<Object, ConcurrentHashMap<String, Set<String>>> cacheStore = userGroupsService.getLugCacheStore();
        if (cacheStore.get(TestConfiguration.ldapuser2) == null)
            throw new Error();

        userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser5);
        userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser6);
        userGroupsService.getAllLdapGroups(TestConfiguration.ldapuser5);
        userGroupsService.getAllLdapGroups(TestConfiguration.nullldapuser);

    }

    /**
     * Test method for
     * {@link com.google.enterprise.connector.sharepoint.ldap.UserGroupsService#getSamAccountNameFromSearchUser(java.lang.String)}
     * .
     */
    @Test
    public void testGetSamAccountNameFromSearchUser() {
        String expectedUserName = TestConfiguration.username;

        String userName3 = userGroupsService.getSamAccountNameForSearchUser(TestConfiguration.userNameFormat3);
        assertNotNull(userName3);
        assertEquals(expectedUserName, userName3);

        String userName1 = userGroupsService.getSamAccountNameForSearchUser(TestConfiguration.userNameFormat1);
        assertNotNull(userName1);
        assertEquals(expectedUserName, userName1);

        String userName2 = userGroupsService.getSamAccountNameForSearchUser(TestConfiguration.userNameFormat2);
        assertNotNull(userName2);
        assertEquals(expectedUserName, userName2);
    }

    /**
     * @throws java.lang.Exception
     */
    @After
    public void tearDown() throws Exception {
        this.ldapConnection = null;
        this.userGroupsService = null;
    }
}