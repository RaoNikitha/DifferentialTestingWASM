;; 2. **Test Description 2:** Place `unreachable` inside a `loop` where the loop body expects to end with a value of type `i64`, but the loop directly leads to `unreachable`. Check if the implementations flag a type mismatch because no value is produced for the loop.

(assert_invalid (module (func $test (loop (result i64) (unreachable)))) "type mismatch")