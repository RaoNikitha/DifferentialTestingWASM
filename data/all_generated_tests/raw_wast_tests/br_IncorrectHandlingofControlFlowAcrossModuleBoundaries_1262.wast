;; 3. **Loop in Imported Function with Br Backwards:**    Design a test where an imported function contains a `loop` with a backward `br`. The test should check if the backward branch jumps to the start of the loop correctly and maintains control flow across the module boundary.

(assert_invalid
  (module
    (import "env" "importedFunc" (func $importedFunc (result i32)))
    (func $test
      (call $importedFunc)
      (loop (result i32)
        (i32.const 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)