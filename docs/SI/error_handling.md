
# (SI-11) Error Handling

## Definition

(A)The information system generates error messages that provide information necessary for corrective actions without revealing information that could be exploited by adversaries.
(B)The information system reveals error messages only to [Assignment: organization-defined personnel or roles].

## Additional Guidance

Organizations carefully consider the structure/content of error messages. The extent to which information systems are able to identify and handle error conditions is guided by organizational policy and operational requirements. Information that could be exploited by adversaries includes, for example, erroneous logon attempts with passwords entered by mistake as the username, mission/business information that can be derived from (if not stated explicitly by) information recorded, and personal information such as account numbers, social security numbers, and credit card numbers. In addition, error messages may provide a covert channel for transmitting information.
