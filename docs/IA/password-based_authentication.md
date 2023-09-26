
# (IA-5(1)) Password-Based Authentication

## Definition

(a)The information system, for password-based authentication, enforces minimum password complexity of [Assignment: organization-defined requirements for case sensitivity, number of characters, mix of upper-case letters, lower-case letters, numbers, and special characters, including minimum requirements for each type];
(b)The information system, for password-based authentication, enforces at least the following number of changed characters when new passwords are created: [Assignment: organization-defined number];
(c)The information system, for password-based authentication, stores and transmits only cryptographically-protected passwords;
(d)The information system, for password-based authentication, enforces password minimum and maximum lifetime restrictions of [Assignment: organization-defined numbers for lifetime minimum, lifetime maximum];
(e)The information system, for password-based authentication prohibits password reuse for [Assignment: organization-defined number] generations; and
(f)The information system, for password-based authentication allows the use of a temporary password for system logons with an immediate change to a permanent password.

## Additional Guidance

This control enhancement applies to single-factor authentication of individuals using passwords as individual or group authenticators, and in a similar manner, when passwords are part of multifactor authenticators. This control enhancement does not apply when passwords are used to unlock hardware authenticators (e.g., Personal Identity Verification cards). The implementation of such password mechanisms may not meet all of the requirements in the enhancement. Cryptographically-protected passwords include, for example, encrypted versions of passwords and one-way cryptographic hashes of passwords. The number of changed characters refers to the number of changes required with respect to the total number of positions in the current password. Password lifetime restrictions do not apply to temporary passwords. To mitigate certain brute force attacks against passwords, organizations may also consider salting passwords.
