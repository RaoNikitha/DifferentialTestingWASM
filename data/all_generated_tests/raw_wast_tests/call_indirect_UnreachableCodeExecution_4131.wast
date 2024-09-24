;; 10. **Call_Indirect with Unaccessed Function Index Reaching Unreachable**:     - Perform `call_indirect` using an inaccessible function index that should trap, ensuring the following code hits `unreachable`.     - Ensures correct handling of index validations and accurate traps leading to unreachable code paths.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem $undefined)) 
    (func $unreachable-check
      (call_indirect (type 0) (i32.const 1))
      unreachable
    )
  )
  "element segment does not specify a function"
)