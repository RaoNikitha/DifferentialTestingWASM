;; 9. **Test Description:**    Develop multiple nested loops interspersed with blocks where a `br` instruction in the innermost loop targets an outermost (or second outermost) block. This test should check for the correct resolution and proper unwinding up to the correctly targeted block, ensuring no erroneous jumps within the nested structures.

(assert_invalid
  (module
    (func $nest-br
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (loop (result i32)
              (block (result i32)
                (loop (result i32)
                  (br 3) 
                )
              )
            )
          )
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)