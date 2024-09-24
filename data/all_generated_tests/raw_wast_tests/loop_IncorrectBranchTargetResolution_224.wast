;; 5. **Test for Mixed Use of `br` and `br_if` Instructions**:    Build a loop structure using both `br` and `br_if` where the `br_if` should branch within the same loop while `br` targets an outer loop. Check if both branch targets are correctly resolved. This tests diverse branching within loop structures.

(assert_invalid
  (module
    (func (loop (block (br 1) (br_if 0 (i32.const 1)) (nop)) end))
  )
  "type mismatch"
)