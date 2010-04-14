<%@ Page Language="C#" Inherits="System.Web.UI.Page"%>
<%@ Assembly Name="Microsoft.SharePoint, Version=11.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Import Namespace="Microsoft.SharePoint.Utilities" %> <%@ Import Namespace="Microsoft.SharePoint" %>
<% Response.ContentType = "text/xml"; %>
<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="gssAcl.generated.sharepoint.connector.enterprise.google.com" xmlns:s1="http://microsoft.com/wsdl/types/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="gssAcl.generated.sharepoint.connector.enterprise.google.com" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="gssAcl.generated.sharepoint.connector.enterprise.google.com">
      <s:import namespace="http://microsoft.com/wsdl/types/" />
      <s:element name="CheckConnectivity">
        <s:complexType />
      </s:element>
      <s:element name="CheckConnectivityResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="CheckConnectivityResult" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAclForUrls">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="urls" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="ArrayOfString">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="string" nillable="true" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:element name="GetAclForUrlsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetAclForUrlsResult" type="tns:GssGetAclForUrlsResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GssGetAclForUrlsResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:GssAclBaseResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="AllAcls" type="tns:ArrayOfGssAcl" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="GssAclBaseResult" abstract="true">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="SiteCollectionUrl" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="SiteCollectionGuid" type="s1:guid" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfGssAcl">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="GssAcl" nillable="true" type="tns:GssAcl" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="GssAcl">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="EntityUrl" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Owner" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="AllAce" type="tns:ArrayOfGssAce" />
          <s:element minOccurs="0" maxOccurs="1" name="LogMessage" type="tns:StringBuilder" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfGssAce">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="GssAce" nillable="true" type="tns:GssAce" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="GssAce">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Principal" type="tns:GssPrincipal" />
          <s:element minOccurs="0" maxOccurs="1" name="Permission" type="tns:GssSharepointPermission" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="GssPrincipal">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="Name" type="s:string" />
          <s:element minOccurs="1" maxOccurs="1" name="Type" type="tns:PrincipalType" />
          <s:element minOccurs="0" maxOccurs="1" name="Members" type="tns:ArrayOfGssPrincipal" />
          <s:element minOccurs="0" maxOccurs="1" name="LogMessage" type="tns:StringBuilder" />
        </s:sequence>
      </s:complexType>
      <s:simpleType name="PrincipalType">
        <s:restriction base="s:string">
          <s:enumeration value="USER" />
          <s:enumeration value="DOMAINGROUP" />
          <s:enumeration value="SPGROUP" />
          <s:enumeration value="NA" />
        </s:restriction>
      </s:simpleType>
      <s:complexType name="ArrayOfGssPrincipal">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="GssPrincipal" nillable="true" type="tns:GssPrincipal" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="StringBuilder">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="Capacity" type="s:int" />
          <s:element minOccurs="1" maxOccurs="1" name="Length" type="s:int" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="GssSharepointPermission">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="GrantRightMask" type="tns:SPBasePermissions" />
          <s:element minOccurs="1" maxOccurs="1" name="DenyRightMask" type="tns:SPBasePermissions" />
        </s:sequence>
      </s:complexType>
      <s:simpleType name="SPBasePermissions">
        <s:list>
          <s:simpleType>
            <s:restriction base="s:string">
              <s:enumeration value="EmptyMask" />
              <s:enumeration value="ViewListItems" />
              <s:enumeration value="AddListItems" />
              <s:enumeration value="EditListItems" />
              <s:enumeration value="DeleteListItems" />
              <s:enumeration value="ApproveItems" />
              <s:enumeration value="OpenItems" />
              <s:enumeration value="ViewVersions" />
              <s:enumeration value="DeleteVersions" />
              <s:enumeration value="CancelCheckout" />
              <s:enumeration value="ManagePersonalViews" />
              <s:enumeration value="ManageLists" />
              <s:enumeration value="ViewFormPages" />
              <s:enumeration value="Open" />
              <s:enumeration value="ViewPages" />
              <s:enumeration value="AddAndCustomizePages" />
              <s:enumeration value="ApplyThemeAndBorder" />
              <s:enumeration value="ApplyStyleSheets" />
              <s:enumeration value="ViewUsageData" />
              <s:enumeration value="CreateSSCSite" />
              <s:enumeration value="ManageSubwebs" />
              <s:enumeration value="CreateGroups" />
              <s:enumeration value="ManagePermissions" />
              <s:enumeration value="BrowseDirectories" />
              <s:enumeration value="BrowseUserInfo" />
              <s:enumeration value="AddDelPrivateWebParts" />
              <s:enumeration value="UpdatePersonalWebParts" />
              <s:enumeration value="ManageWeb" />
              <s:enumeration value="UseClientIntegration" />
              <s:enumeration value="UseRemoteAPIs" />
              <s:enumeration value="ManageAlerts" />
              <s:enumeration value="CreateAlerts" />
              <s:enumeration value="EditMyUserInfo" />
              <s:enumeration value="EnumeratePermissions" />
              <s:enumeration value="FullMask" />
            </s:restriction>
          </s:simpleType>
        </s:list>
      </s:simpleType>
      <s:element name="GetAclChangesSinceToken">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="strChangeToken" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAclChangesSinceTokenResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetAclChangesSinceTokenResult" type="tns:GssGetAclChangesSinceTokenResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GssGetAclChangesSinceTokenResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:GssAclBaseResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="AllChanges" type="tns:GssAclChangeCollection" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:complexType name="GssAclChangeCollection">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="1" name="ChangeToken" type="s:string" />
          <s:element minOccurs="0" maxOccurs="1" name="Changes" type="tns:ArrayOfGssAclChange" />
          <s:element minOccurs="0" maxOccurs="1" name="LogMessage" type="tns:StringBuilder" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="ArrayOfGssAclChange">
        <s:sequence>
          <s:element minOccurs="0" maxOccurs="unbounded" name="GssAclChange" nillable="true" type="tns:GssAclChange" />
        </s:sequence>
      </s:complexType>
      <s:complexType name="GssAclChange">
        <s:sequence>
          <s:element minOccurs="1" maxOccurs="1" name="ChangedObject" type="tns:ObjectType" />
          <s:element minOccurs="1" maxOccurs="1" name="ChangeType" type="tns:SPChangeType" />
          <s:element minOccurs="0" maxOccurs="1" name="Hint" type="s:string" />
        </s:sequence>
      </s:complexType>
      <s:simpleType name="ObjectType">
        <s:restriction base="s:string">
          <s:enumeration value="NA" />
          <s:enumeration value="SECURITY_POLICY" />
          <s:enumeration value="ADMINISTRATORS" />
          <s:enumeration value="GROUP" />
          <s:enumeration value="USER" />
          <s:enumeration value="WEB" />
          <s:enumeration value="LIST" />
          <s:enumeration value="ITEM" />
        </s:restriction>
      </s:simpleType>
      <s:simpleType name="SPChangeType">
        <s:restriction base="s:string">
          <s:enumeration value="Add" />
          <s:enumeration value="Update" />
          <s:enumeration value="Delete" />
          <s:enumeration value="Rename" />
          <s:enumeration value="MoveAway" />
          <s:enumeration value="MoveInto" />
          <s:enumeration value="Restore" />
          <s:enumeration value="RoleAdd" />
          <s:enumeration value="RoleDelete" />
          <s:enumeration value="RoleUpdate" />
          <s:enumeration value="AssignmentAdd" />
          <s:enumeration value="AssignmentDelete" />
          <s:enumeration value="MemberAdd" />
          <s:enumeration value="MemberDelete" />
          <s:enumeration value="SystemUpdate" />
          <s:enumeration value="Navigation" />
        </s:restriction>
      </s:simpleType>
      <s:element name="ResolveSPGroup">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="groupId" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ResolveSPGroupResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ResolveSPGroupResult" type="tns:GssResolveSPGroupResult" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:complexType name="GssResolveSPGroupResult">
        <s:complexContent mixed="false">
          <s:extension base="tns:GssAclBaseResult">
            <s:sequence>
              <s:element minOccurs="0" maxOccurs="1" name="Prinicpals" type="tns:ArrayOfGssPrincipal" />
            </s:sequence>
          </s:extension>
        </s:complexContent>
      </s:complexType>
      <s:element name="GetAffectedListIDsForChangeWeb">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="webGuId" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAffectedListIDsForChangeWebResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetAffectedListIDsForChangeWebResult" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAffectedItemIDsForChangeList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listGuId" type="s:string" />
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAffectedItemIDsForChangeListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetAffectedItemIDsForChangeListResult" type="tns:ArrayOfString" />
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
    <s:schema elementFormDefault="qualified" targetNamespace="http://microsoft.com/wsdl/types/">
      <s:simpleType name="guid">
        <s:restriction base="s:string">
          <s:pattern value="[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}" />
        </s:restriction>
      </s:simpleType>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="CheckConnectivitySoapIn">
    <wsdl:part name="parameters" element="tns:CheckConnectivity" />
  </wsdl:message>
  <wsdl:message name="CheckConnectivitySoapOut">
    <wsdl:part name="parameters" element="tns:CheckConnectivityResponse" />
  </wsdl:message>
  <wsdl:message name="GetAclForUrlsSoapIn">
    <wsdl:part name="parameters" element="tns:GetAclForUrls" />
  </wsdl:message>
  <wsdl:message name="GetAclForUrlsSoapOut">
    <wsdl:part name="parameters" element="tns:GetAclForUrlsResponse" />
  </wsdl:message>
  <wsdl:message name="GetAclChangesSinceTokenSoapIn">
    <wsdl:part name="parameters" element="tns:GetAclChangesSinceToken" />
  </wsdl:message>
  <wsdl:message name="GetAclChangesSinceTokenSoapOut">
    <wsdl:part name="parameters" element="tns:GetAclChangesSinceTokenResponse" />
  </wsdl:message>
  <wsdl:message name="ResolveSPGroupSoapIn">
    <wsdl:part name="parameters" element="tns:ResolveSPGroup" />
  </wsdl:message>
  <wsdl:message name="ResolveSPGroupSoapOut">
    <wsdl:part name="parameters" element="tns:ResolveSPGroupResponse" />
  </wsdl:message>
  <wsdl:message name="GetAffectedListIDsForChangeWebSoapIn">
    <wsdl:part name="parameters" element="tns:GetAffectedListIDsForChangeWeb" />
  </wsdl:message>
  <wsdl:message name="GetAffectedListIDsForChangeWebSoapOut">
    <wsdl:part name="parameters" element="tns:GetAffectedListIDsForChangeWebResponse" />
  </wsdl:message>
  <wsdl:message name="GetAffectedItemIDsForChangeListSoapIn">
    <wsdl:part name="parameters" element="tns:GetAffectedItemIDsForChangeList" />
  </wsdl:message>
  <wsdl:message name="GetAffectedItemIDsForChangeListSoapOut">
    <wsdl:part name="parameters" element="tns:GetAffectedItemIDsForChangeListResponse" />
  </wsdl:message>
  <wsdl:portType name="GssAclMonitorSoap">
    <wsdl:operation name="CheckConnectivity">
      <wsdl:input message="tns:CheckConnectivitySoapIn" />
      <wsdl:output message="tns:CheckConnectivitySoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAclForUrls">
      <wsdl:input message="tns:GetAclForUrlsSoapIn" />
      <wsdl:output message="tns:GetAclForUrlsSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAclChangesSinceToken">
      <wsdl:input message="tns:GetAclChangesSinceTokenSoapIn" />
      <wsdl:output message="tns:GetAclChangesSinceTokenSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="ResolveSPGroup">
      <wsdl:input message="tns:ResolveSPGroupSoapIn" />
      <wsdl:output message="tns:ResolveSPGroupSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAffectedListIDsForChangeWeb">
      <wsdl:input message="tns:GetAffectedListIDsForChangeWebSoapIn" />
      <wsdl:output message="tns:GetAffectedListIDsForChangeWebSoapOut" />
    </wsdl:operation>
    <wsdl:operation name="GetAffectedItemIDsForChangeList">
      <wsdl:input message="tns:GetAffectedItemIDsForChangeListSoapIn" />
      <wsdl:output message="tns:GetAffectedItemIDsForChangeListSoapOut" />
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="GssAclMonitorSoap" type="tns:GssAclMonitorSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="CheckConnectivity">
      <soap:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/CheckConnectivity" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAclForUrls">
      <soap:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAclForUrls" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAclChangesSinceToken">
      <soap:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAclChangesSinceToken" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ResolveSPGroup">
      <soap:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/ResolveSPGroup" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAffectedListIDsForChangeWeb">
      <soap:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAffectedListIDsForChangeWeb" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAffectedItemIDsForChangeList">
      <soap:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAffectedItemIDsForChangeList" style="document" />
      <wsdl:input>
        <soap:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="GssAclMonitorSoap12" type="tns:GssAclMonitorSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http" />
    <wsdl:operation name="CheckConnectivity">
      <soap12:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/CheckConnectivity" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAclForUrls">
      <soap12:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAclForUrls" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAclChangesSinceToken">
      <soap12:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAclChangesSinceToken" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ResolveSPGroup">
      <soap12:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/ResolveSPGroup" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAffectedListIDsForChangeWeb">
      <soap12:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAffectedListIDsForChangeWeb" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAffectedItemIDsForChangeList">
      <soap12:operation soapAction="gssAcl.generated.sharepoint.connector.enterprise.google.com/GetAffectedItemIDsForChangeList" style="document" />
      <wsdl:input>
        <soap12:body use="literal" />
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal" />
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="GssAclMonitor">
    <wsdl:port name="GssAclMonitorSoap" binding="tns:GssAclMonitorSoap">
      <soap:address location=<% SPEncode.WriteHtmlEncodeWithQuote(Response, SPWeb.OriginalBaseUrl(Request), '"'); %> />
    </wsdl:port>
    <wsdl:port name="GssAclMonitorSoap12" binding="tns:GssAclMonitorSoap12">
      <soap12:address location=<% SPEncode.WriteHtmlEncodeWithQuote(Response, SPWeb.OriginalBaseUrl(Request), '"'); %> />
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>