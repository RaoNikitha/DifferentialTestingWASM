;; Test Description 7: Nest several blocks and loops where a mix of `br` and `br_if` instructions target different, sometimes deeply nested, blocks. Mismanagement in label indexing could cause unexpected eternal loops.

(assert_invalid
  (module (func $test-nested-blocks (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (br_if 1 (i32.const 0)) (br 2 (i32.const 1))
          )
        )
      ) 
      (i32.const 2)
    )
  ))
  "type mismatch"
)