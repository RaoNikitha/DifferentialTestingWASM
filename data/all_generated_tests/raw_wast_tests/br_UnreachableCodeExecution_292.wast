;; 3. **Complex Conditional Branching:**    Create a set of nested `if` structures with alternating conditional branches that all converge at a common point. Use `br` instructions to leap across several blocks and verify the control flow to ensure no `unreachable` code is erroneously executed.

(assert_invalid
  (module
    (func $complex-conditional-branching
      (block $outer
        (block $mid
          (block $inner
            (br_if 0 (i32.const 1))
            (i32.const 1)
          )
          (br_if 1 (i32.const 0))
          (i32.const 1)
        )
        (br_if 2 (i32.const 0))
        (br 0)
      )
    )
  )
  "unknown label"
)