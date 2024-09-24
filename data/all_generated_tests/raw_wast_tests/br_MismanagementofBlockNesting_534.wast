;; 5. Set up a `block` encompassing multiple nested `loop` instructions, with a `br` targeting the outermost block from deep within a nested loop. This checks whether the correct unwinding of the operand stack and label resolution are maintained.

(assert_invalid
  (module
    (func
      (block (result i32)
        (loop (result i32)
          (loop (result i32)
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)