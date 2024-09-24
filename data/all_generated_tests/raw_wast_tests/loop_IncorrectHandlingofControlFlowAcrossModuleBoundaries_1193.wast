;; Test 4: A scenario where a loop within an exported function makes use of `br_table` to perform an indirect branch to another exported function. This checks if the label indexing and control flow transfer between modules are correctly handled in both implementations.

(assert_invalid
  (module
    (func $targetFunc (result i32) (i32.const 42)) 
    (export "target" (func $targetFunc))
    (func (export "testFunc")
      (local $x i32)
      (loop (block $label (br_table $label $targetFunc (local.get $x))))
    )
  )
  "type mismatch"
)