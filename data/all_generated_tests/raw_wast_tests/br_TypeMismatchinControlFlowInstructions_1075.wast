;; 6. Implement a loop with a `br` instruction targeting a parent block that expects a string result. Ensure no string is placed on the operand stack. This verifies the correct handling of string-type constraints in branched control flows.

(assert_invalid
  (module
    (func $type-mismatch-in-loop
      (block $parent (result string)
        (loop $inner
          (br $parent)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)