;; 10. **Test Description:**    Design an intricate combination of nested `if`, `loop`, and `block` constructs, placing a `br` within an innermost `block` that targets a `loop` outside the immediate nesting level. The purpose is to validate if the `br` instruction properly indexes and jumps to the correct outer loop without misinterpreting nested structures.  Each test is framed to highlight any discrepancies in how branch targets are resolved within nested control structures, ensuring strict adherence to the behavioral rules of the `br` instruction.

(assert_invalid
  (module (func $nested_br (result i32)
    (block (result i32)
      (i32.const 0)
      (if (result i32)
        (i32.const 1)
        (block
          (loop
            (block
              (br 1)
            )
          )
        )
      )
    )
  ))
  "unknown label"
)