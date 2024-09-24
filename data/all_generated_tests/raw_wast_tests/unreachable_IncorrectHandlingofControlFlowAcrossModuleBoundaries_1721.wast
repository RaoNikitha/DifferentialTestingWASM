;; 2. Create a WebAssembly module (`Module A`) that contains an infinite loop ending with an `unreachable` instruction followed by an `i32.const` instruction. Export this infinite loop function and call it from another module (`Module B`). Verify if `Module B` provides consistent trapping behavior, ensuring no instructions beyond the call are executed.

(assert_invalid
  (module
    (func $infinite_loop_with_unreachable
      (loop
        br 0
        unreachable
        i32.const 0
      )
    )
    (export "infinite_loop_func" (func $infinite_loop_with_unreachable))
  )
  "type mismatch"
)