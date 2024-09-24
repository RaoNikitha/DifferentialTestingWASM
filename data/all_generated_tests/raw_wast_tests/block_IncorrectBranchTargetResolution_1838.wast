;; 9. **Zero Label Resolved Incorrectly**:    - Initiate a `block` with a simple structure but an incorrect `0` label for a `br` that should target a nested block instead.    - Ensure that the implementation accurately resolves label `0` to the correct outer block and doesn't misinterpret the scope boundary.

(assert_invalid
  (module (func $test-zero-label-resolution
    (block (block (br 0)))
  ))
  "type mismatch"
)