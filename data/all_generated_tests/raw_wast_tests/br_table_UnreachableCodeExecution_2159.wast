;; 9. **Test Description**: A scenario where the `br_table` instruction has a default target label with a mismatching operand type stack configuration that leads to an `unreachable` instruction if the operand is out of bounds. This checks correct default branch handling with type constraints.

(assert_invalid
  (module
    (func
      (block (i32.const 0)
        (block (result f32)
          (br_table 0 1 (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)