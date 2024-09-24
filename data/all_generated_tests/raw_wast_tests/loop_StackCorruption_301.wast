;; 2. **Backward Branch and Redundant Pops**: Implement a loop containing a backward branch that attempts to pop more operands than initially supplied. This test can identify stack underflow issues, specifically targeting incorrect stack checks by `Wizard Engine` with `popE`.

(assert_invalid
  (module
    (func (loop (result i32)
      (br 0)
      (unreachable)
    ) 
    (i32.const 1)
    (i32.const 2)
    )
  )
  "type mismatch"
)