;; 5. **Test Description:** Use `unreachable` in combination with a branch (`br`) inside a `block` that leads to mismatched types upon returning from the branch.    **Constraint:** The `br` should assume consistent stack types, which is altered by `unreachable`.    **Reasoning:** Checks if branch type implications handle the immediate trap correctly.

(assert_invalid
  (module 
    (func $type-br-unreachable-after
      (block 
        (br 0) 
        (unreachable)
      )
    )
  )
  "type mismatch"
)