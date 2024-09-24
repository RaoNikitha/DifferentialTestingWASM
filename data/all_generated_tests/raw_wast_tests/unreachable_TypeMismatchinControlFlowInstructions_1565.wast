;; 6. **Test 6: Unreachable Inside a Branch of Select with Incorrect Types**    - A `select` instruction where one option involves an `unreachable` and the other a value of a mismatched type, leading to possible conflicts in type expectations.    - **Constraint Checked:** Tests the type-checking rules of `select` environments involving `unreachable`.

(assert_invalid
  (module (func (select (i32.const 1) (unreachable) (f32.const 1)) (drop)))
  "type mismatch"
)