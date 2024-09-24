;; 7. Implement a test with a `loop` that contains a type mismatch in its result stack type and the body instructions’ inputs. Check if `WebAssembly` raises an error during the type-check while `wizard_engine` improperly processes leading to an infinite loop.

(assert_invalid
  (module (func $mismatched-loop (result i32)
    (loop (result i32) (i64.const 0) (drop))
  ))
  "type mismatch"
)