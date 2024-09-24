;; 8. **Stack-Polymorphic Context Misuse**: Integrate use of `unreachable` in combination with `nop` and branching to observe stack effects. Confirm that incorrect handling of `nop` doesn't cause deviation in the behavior of `unreachable` context.

(assert_invalid
  (module
    (func $unreachable-nop
      unreachable
      nop
      br 0))
  "type mismatch"
)