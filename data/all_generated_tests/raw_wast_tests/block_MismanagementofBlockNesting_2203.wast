;; 4. Design a series of nested `block` and `loop` instructions where a `br_table` inside the innermost `block` should break to various levels of enclosing blocks based on a dynamic index. Confirm that the correct block is resumed corresponding to the index.

(assert_invalid
  (module
    (func $nested-block-loop 
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_table 1 0 
              (i32.const 1)
            )
          )
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)