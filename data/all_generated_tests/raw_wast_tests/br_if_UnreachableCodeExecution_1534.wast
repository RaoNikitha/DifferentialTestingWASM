;; 5. **Test Description:** Construct a scenario with adjacent `if` and `else` blocks containing stack operations. Use `br_if` to transition conditionally between these blocks. Add `unreachable` instructions outside the `else` block. This verifies correct conditional branching preventing invalid stack references from reaching the `unreachable` code.

(assert_invalid
  (module
    (func (block (if (i32.const 0) 
      (then (i32.const 1) (br_if 0))
      (else (unreachable)))
    ))
  )
  "type mismatch"
)