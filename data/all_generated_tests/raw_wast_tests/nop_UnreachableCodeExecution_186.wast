;; 7. Test Description: Sequence multiple `nop` instructions before an `unreachable`. Validate that the control flow handles consecutive `nop` instructions without impact and correctly traps at the `unreachable`.

(assert_invalid
  (module (func (nop) (nop) (unreachable) (nop)))
  "unreachable in apparent order"
)