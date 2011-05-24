/**
 * GetUserProfileByGuidResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.google.enterprise.connector.sharepoint.generated.userprofileservice;

public class GetUserProfileByGuidResponse  implements java.io.Serializable {
    private com.google.enterprise.connector.sharepoint.generated.userprofileservice.PropertyData[] getUserProfileByGuidResult;

    public GetUserProfileByGuidResponse() {
    }

    public GetUserProfileByGuidResponse(
           com.google.enterprise.connector.sharepoint.generated.userprofileservice.PropertyData[] getUserProfileByGuidResult) {
           this.getUserProfileByGuidResult = getUserProfileByGuidResult;
    }


    /**
     * Gets the getUserProfileByGuidResult value for this GetUserProfileByGuidResponse.
     * 
     * @return getUserProfileByGuidResult
     */
    public com.google.enterprise.connector.sharepoint.generated.userprofileservice.PropertyData[] getGetUserProfileByGuidResult() {
        return getUserProfileByGuidResult;
    }


    /**
     * Sets the getUserProfileByGuidResult value for this GetUserProfileByGuidResponse.
     * 
     * @param getUserProfileByGuidResult
     */
    public void setGetUserProfileByGuidResult(com.google.enterprise.connector.sharepoint.generated.userprofileservice.PropertyData[] getUserProfileByGuidResult) {
        this.getUserProfileByGuidResult = getUserProfileByGuidResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof GetUserProfileByGuidResponse)) return false;
        GetUserProfileByGuidResponse other = (GetUserProfileByGuidResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.getUserProfileByGuidResult==null && other.getGetUserProfileByGuidResult()==null) || 
             (this.getUserProfileByGuidResult!=null &&
              java.util.Arrays.equals(this.getUserProfileByGuidResult, other.getGetUserProfileByGuidResult())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        if (getGetUserProfileByGuidResult() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getGetUserProfileByGuidResult());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getGetUserProfileByGuidResult(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(GetUserProfileByGuidResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://microsoft.com/webservices/SharePointPortalServer/UserProfileService", ">GetUserProfileByGuidResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("getUserProfileByGuidResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://microsoft.com/webservices/SharePointPortalServer/UserProfileService", "GetUserProfileByGuidResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://microsoft.com/webservices/SharePointPortalServer/UserProfileService", "PropertyData"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://microsoft.com/webservices/SharePointPortalServer/UserProfileService", "PropertyData"));
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType, 
           java.lang.Class _javaType,  
           javax.xml.namespace.QName _xmlType) {
        return 
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}