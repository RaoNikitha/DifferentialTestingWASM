;; 2. **Forward Branch in Complex Control Structure:**    - Test a `block` containing an `if-else` construct, with `br` instructions targeting the outer `block`'s end.    - This verifies if the CFG correctly handles multiple levels of structured control and if the `br` instruction correctly resumes execution after the target `end`.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 1)
        (if (result i32) (i32.const 2) (then (br 1))) (else (br 1))
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)