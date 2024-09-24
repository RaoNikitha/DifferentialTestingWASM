;; 2. **Index Out of Bounds Test**:    - **Description**: Attempt to use `call_indirect` with an index that is out of bounds of the function table size, causing an index out of bounds trap.    - **Constraint**: Verify the correct handling of table boundaries.    - **Unreachable Code**: If an invalid index is accessed, the resulting trap avoids possible 'unreachable' execution.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func $out-of-bounds 
      (call_indirect (type 0) (i32.const 2))
    )
  )
  "undefined function"
)