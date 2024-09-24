;; 8. Multiple `nop` instructions enclosed within a `block` structure to ensure that the `block`'s stack behavior is consistent regardless of the presence of `nop`, highlighting stack preservation issues.

(assert_malformed
  (module (func (block (nop) (nop))))
  "malformed upload"
)