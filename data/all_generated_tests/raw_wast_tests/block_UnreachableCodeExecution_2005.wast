;; 6. Design a `block` that uses `br_if` to conditionally branch to the end of the block or an `unreachable` instruction if certain stack operand conditions are not met, ensuring proper handling of stack changes in conditional branches.

(assert_invalid
  (module
    (func $conditional-branch-stack-mismatch (result i32)
      (block (result i32)
        (i32.const 1)
        (br_if 0 (i32.eqz (i32.const 0)))
        (unreachable)
      )
    )
  )
  "type mismatch"
)