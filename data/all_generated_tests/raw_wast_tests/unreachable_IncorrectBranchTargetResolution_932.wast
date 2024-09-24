;; Use an `if` condition with branches and place the `unreachable` instruction inside the `block` of the `if` branch. Follow it with a `br` instruction to an outer block. Verify if the trap occurs in situations where the branch target resolves incorrectly in wizard_engine implementation.

(assert_invalid
  (module (func $type-if-block-unreachable-branch
    (block (result i32)
      (if (i32.const 1) (then
        (block
          (unreachable)
          (br 1 (i32.const 0))
        )
      ))
    )
  ))
  "type mismatch"
)