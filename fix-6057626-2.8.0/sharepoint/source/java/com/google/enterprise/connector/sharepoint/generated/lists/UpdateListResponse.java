/**
 * UpdateListResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package com.google.enterprise.connector.sharepoint.generated.lists;

public class UpdateListResponse  implements java.io.Serializable {
    private com.google.enterprise.connector.sharepoint.generated.lists.UpdateListResponseUpdateListResult updateListResult;

    public UpdateListResponse() {
    }

    public UpdateListResponse(
           com.google.enterprise.connector.sharepoint.generated.lists.UpdateListResponseUpdateListResult updateListResult) {
           this.updateListResult = updateListResult;
    }


    /**
     * Gets the updateListResult value for this UpdateListResponse.
     *
     * @return updateListResult
     */
    public com.google.enterprise.connector.sharepoint.generated.lists.UpdateListResponseUpdateListResult getUpdateListResult() {
        return updateListResult;
    }


    /**
     * Sets the updateListResult value for this UpdateListResponse.
     *
     * @param updateListResult
     */
    public void setUpdateListResult(com.google.enterprise.connector.sharepoint.generated.lists.UpdateListResponseUpdateListResult updateListResult) {
        this.updateListResult = updateListResult;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof UpdateListResponse)) return false;
        UpdateListResponse other = (UpdateListResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true &&
            ((this.updateListResult==null && other.getUpdateListResult()==null) ||
             (this.updateListResult!=null &&
              this.updateListResult.equals(other.getUpdateListResult())));
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
        if (getUpdateListResult() != null) {
            _hashCode += getUpdateListResult().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(UpdateListResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://schemas.microsoft.com/sharepoint/soap/", ">UpdateListResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("updateListResult");
        elemField.setXmlName(new javax.xml.namespace.QName("http://schemas.microsoft.com/sharepoint/soap/", "UpdateListResult"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://schemas.microsoft.com/sharepoint/soap/", ">>UpdateListResponse>UpdateListResult"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
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
