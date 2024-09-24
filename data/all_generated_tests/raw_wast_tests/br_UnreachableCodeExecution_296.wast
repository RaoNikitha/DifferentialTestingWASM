;; 7. **Wonky Nested Block Branching:**    Design a sequence of differently nested blocks with the `br` instruction occasionally jumping two or more levels outwards. Verify if the control flow correctly exits from the intended target block without hitting `unreachable` instructions due to mislabeling or context misinterpretation.

(assert_invalid
  (module
    (func $wonky-nested-block-branching
      (block
        (block
          (block
            (i32.const 1)
            (i32.const 2)
            (br 2)
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
      (drop)
    )
  )
  "type mismatch"
)