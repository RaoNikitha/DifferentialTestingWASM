;; 8. **Dynamic Conditionals with Branching Test**:    - Create a scenario involving dynamic conditional logic (`if-else`) within nested blocks and loops, using `br` to conditionally branch out of blocks. Validate that both true and false branches resolve correctly to specified targets without erroneously branching to unintended blocks.

(assert_invalid
  (module
    (func $dynamic-conditionals-with-branching
      (block (result i32)
        (block
          (br_if 1 (i32.const 1)) 
          (i32.const 0)
        )
        (if (result i32) 
          (i32.const 1)
          (then (i32.const 42) (br 0))
          (else (i32.const 99) (br 0))
        )
      )
    )
  )
  "type mismatch"
)