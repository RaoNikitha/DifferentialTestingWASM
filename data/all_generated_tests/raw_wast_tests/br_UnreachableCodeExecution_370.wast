;; 1. Test a `br` instruction that targets a mid-level nested `block` that falls through to an `unreachable` instruction, ensuring that the control flow correctly breaks to the outermost block.

(assert_invalid
  (module
    (func $test
      (block
        (block
          (block
            (br 1)
            unreachable
          )
        )
      )
    )
  )
  "type mismatch"
)