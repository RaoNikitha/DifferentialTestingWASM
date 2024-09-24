;; 3. Implement a function with multiple labeled blocks, placing an `unreachable` instruction before a `br_table` instruction. The `unreachable` should trap directly, and the branch table should never get executed, confirming correct label resolution.

(assert_invalid
  (module (func $multiple-labeled-blocks
    (block $label1
      (block $label2
        (unreachable)
        (br_table $label1 $label2 (i32.const 0))
      )
    )
  ))
  "unreachable"
)