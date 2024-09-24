;; Test 10: Implement a scenario where `br_table` references nested `block` and `loop` structures, including an invalid index to test how different implementations manage context separation and valid control flow targets.

(assert_invalid
 (module
  (func $test-nested-block-loop
   (block
    (loop
     (br_if 2 (i32.const 1))
    )
   )
  )
 )
 "unknown label"
)