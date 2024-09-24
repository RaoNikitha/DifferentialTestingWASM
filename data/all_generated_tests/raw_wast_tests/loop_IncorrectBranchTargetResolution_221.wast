;; 2. **Test for Incorrect Target in Sequential Loops**:    Construct multiple sequential loops where a `br` targets the third loop, and check if the loop branching is accurately resolving to the correct third loop. This verifies handling of non-nested, sequential loops.

(assert_invalid
  (module
    (func (loop (result i32) (nop)) (loop (result i32) (nop)) (loop (result i32) (br 2)))
  )
  "type mismatch"
)