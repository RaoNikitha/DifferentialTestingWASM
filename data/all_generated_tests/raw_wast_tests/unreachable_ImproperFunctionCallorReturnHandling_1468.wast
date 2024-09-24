;; 9. **Test Description:**    - Sequence of call hierarchy where intermediary function results in `unreachable` and validate if higher call levels trap as expected.    - This test verifies correct trap propagation and handling in multiple levels of function calls encountering `unreachable`.

(assert_invalid
  (module
    (func $callee (unreachable))
    (func $caller (call $callee) (i32.const 0) (drop))
    (func (call $caller))
  )
  "type mismatch"
)