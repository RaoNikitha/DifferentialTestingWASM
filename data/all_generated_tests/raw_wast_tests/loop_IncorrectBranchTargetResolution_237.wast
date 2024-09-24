;; 8. Develop a scenario including a `loop` with interleaved `br_table` and `if` structures. Each branch should be tested for correct target resolution, especially with indirect branches.

(assert_invalid
  (module
    (func $test
      (i32.const 0)
      (loop $loop1 (result i32)
        (block $block1 (result i32)
          (br_table $loop1 $block1 (i32.const 0))
        )
        (if (i32.const 1)
          (then (br $loop1))
          (else (br $block1))
        )
      )
    )
  )
  "type mismatch"
)