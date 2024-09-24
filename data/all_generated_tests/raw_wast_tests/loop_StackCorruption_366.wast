;; 7. **Test Description:**    - Involves utilizing global variables within a loop and independently pushed onto stack.    - **Constraint Checked:** Manage globals that are pushed and popped within loops without stack issues.    - **Relation to Stack Corruption:** Usage of globals incorrectly handled can create stack misalignments.    ```wasm    (module      (global $g (mut i32) (i32.const 0))      (func (export "test") (result i32)        (loop (result i32)          (global.get $g)          i32.const 1          i32.add          global.set $g          global.get $g          i32.const 10          i32.ne          br_if 0        end))    )    ```

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func (export "test") (result i32)
      (loop (result i32)
        (global.get $g)
        i32.const 1
        i32.add
        global.set $g
        global.get $g
        i32.const 10
        i32.ne
        br_if 0
      end)
    )
  )
  "type mismatch"
)