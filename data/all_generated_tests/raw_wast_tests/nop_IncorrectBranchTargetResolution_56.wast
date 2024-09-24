;; Test 7: Implement a sequence of `nop` instructions followed by a `loop` and a `br_if` targeting the loop. Make sure that the loop control flow correctly targets the loop and iterates as expected without errors.

 ;; (module
  (func $test-loop
    loop $label
      nop
      nop
      nop
      br_if $label (i32.const 1)
    end
  )
  (export "test" (func $test-loop))
)