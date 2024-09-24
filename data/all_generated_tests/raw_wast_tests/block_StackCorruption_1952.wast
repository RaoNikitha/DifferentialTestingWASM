;; 3. **Branch with Inconsistent Stack State**: Use `br` or `br_if` instructions inside a block to branch out to a block that expects a different stack state (different number or type of values). Ensure that stack state alignment is properly enforced.

(assert_invalid
  (module
    (func $branch-inconsistent-stack (result i32)
      (block (result i32)
        (br 0 (i32.const 1))
        (br 0 (i64.const 2))
      )
    )
  )
  "type mismatch"
)