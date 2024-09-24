;; Test 6: Use `nop` inside a loop with nested `if` conditions containing `br_if` branches. Verify the loop handles control transitions correctly and terminates on expected conditions.

 ;; (module
  (func $test-loop-if (loop $loop (nop) (if (i32.eqz (i32.const 0)) (then (nop)) (else (br_if $loop (i32.const 1)))) (br $loop)))
)