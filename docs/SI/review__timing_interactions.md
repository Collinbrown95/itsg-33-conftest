
# (SI-10(4)) Review / Timing Interactions

## Definition

The organization accounts for timing interactions among information system components in determining appropriate responses for invalid inputs.

## Additional Guidance

In addressing invalid information system inputs received across protocol interfaces, timing interfaces become relevant, where one protocol needs to consider the impact of the error response on other protocols within the protocol stack. For example, 802.xx standard wireless network protocols do not interact well with Transmission Control Protocols (TCP) when packets are dropped (which could be due to invalid packet input). TCP assumes packet losses are due to congestion, while packets lost over 802.xx links are typically dropped due to collisions or noise on the link. If TCP makes a congestion response, it takes precisely the wrong action in response to a collision event. Adversaries may be able to use apparently acceptable individual behaviours of the protocols in concert to achieve adverse effects through suitable construction of invalid input.
