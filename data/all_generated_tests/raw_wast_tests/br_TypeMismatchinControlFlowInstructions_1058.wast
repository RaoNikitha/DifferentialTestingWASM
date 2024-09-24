;; 9. **Test 9: Forward Branch Misalignment in Type**    - Construct a forward branch targeting a block expecting an `i32`, but a `br` supplies `i64`.    - Ensures type enforcement in forward branches targeting specific control structures.    - Tests the correct result type alignment upon block exit after a branch operation.

(assert_invalid
  (module (func $type-forward-branch-misalignment
    (block (result i32)
      (br 0 (i64.const 10))
      (i32.const 20))
  ))
  "type mismatch"
)