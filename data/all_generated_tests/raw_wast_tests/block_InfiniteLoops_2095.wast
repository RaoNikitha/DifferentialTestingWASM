;; Implement a recursive structure with a `block` containing multiple `loops`, where each loop uses `br_table` to select specific breaking points, checking if `pushControl` and label shifts handle it without causing infinite recursion or loops.

(assert_invalid
 (module
  (func $complex-block-nesting
    (block (result i32)
      (block
        (loop (result i32)
          (block
            (br_table 0 1 2 (i32.const 0))
            (br 1)
          )
        )
        (i32.const 1)
      )
    )
  )
 )
 "type mismatch"
)