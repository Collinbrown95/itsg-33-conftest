
# (IA-5(2)) PKI-Based Authentication

## Definition

(a)The information system, for PKI-based authentication, validates certifications by constructing and verifying a certification path to an accepted trust anchor including checking certificate status information;
(b)The information system, for PKI-based authentication, enforces authorized access to the corresponding private key;
(c)The information system, for PKI-based authentication, maps the authenticated identity to the account of the individual or group; and
(d)The information system, for PKI-based authentication, implements a local cache of revocation data to support path discovery and validation in case of inability to access revocation information via the network.

## Additional Guidance

Status information for certification paths includes, for example, certificate revocation lists or certificate status protocol responses. For PIV cards, validation of certifications involves the construction and verification of a certification path to the Common Policy Root trust anchor including certificate policy processing.
