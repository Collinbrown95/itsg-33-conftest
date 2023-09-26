
# (IA-5) Authenticator Management

## Definition

(A)The organization manages information system authenticators by verifying, as part of the initial authenticator distribution, the identity of the individual, group, role, or device receiving the authenticator.
(B)The organization manages information system authenticators by establishing initial authenticator content for authenticators defined by the organization.
(C)The organization manages information system authenticators by ensuring that authenticators have sufficient strength of mechanism for their intended use.
(D)The organization manages information system authenticators by establishing and implementing administrative procedures for initial authenticator distribution, for lost/compromised or damaged authenticators, and for revoking authenticators.
(E)The organization manages information system authenticators by changing the default content of authenticators prior to information system installation.
(F)The organization manages information system authenticators by establishing minimum and maximum lifetime restrictions and reuse conditions for authenticators.
(G)The organization manages information system authenticators by changing/refreshing authenticators [Assignment: organization-defined time period by authenticator type].
(H)The organization manages information system authenticators by protecting authenticator content from unauthorized disclosure and modification.
(I)The organization manages information system authenticators by requiring individuals to take, and having devices implement, specific security safeguards to protect authenticators.
(J)The organization manages information system authenticators by changing authenticators for group/role accounts when membership to those accounts changes.

## Additional Guidance

Individual authenticators include, for example, passwords, tokens, biometrics, Public Key Infrastructure (PKI) certificates, and key cards. Initial authenticator content is the actual content (e.g., the initial password) as opposed to requirements about authenticator content (e.g., minimum password length). In many cases, developers ship information system components with factory default authentication credentials to allow for initial installation and configuration. Default authentication credentials are often well known, easily discoverable, and present a significant security risk. The requirement to protect individual authenticators may be implemented via control PL-4 or PS-6 for authenticators in the possession of individuals and by controls AC-3, AC-6, and SC-28 for authenticators stored within organizational information systems (e.g., passwords stored in hashed or encrypted formats, files containing encrypted or hashed passwords accessible with administrator privileges). Information systems support individual authenticator management by organization-defined settings and restrictions for various authenticator characteristics including, for example, minimum password length, password composition, validation time window for time synchronous one-time tokens, and number of allowed rejections during the verification stage of biometric authentication. Specific actions that can be taken to safeguard authenticators include, for example, maintaining possession of individual authenticators, not loaning or sharing individual authenticators with others, and reporting lost, stolen, or compromised authenticators immediately. Authenticator management includes issuing and revoking, when no longer needed, authenticators for temporary access such as that required for remote maintenance. Device authenticators include, for example, certificates and passwords.
