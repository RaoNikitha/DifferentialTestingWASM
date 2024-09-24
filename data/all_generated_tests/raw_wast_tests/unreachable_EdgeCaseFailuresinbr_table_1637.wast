;; 8. **Test Description:**    - **Edge Case:** `br_table` with indirect call instructions and `unreachable`.    - **Constraint Checked:** Integrate and examine combined branching with calls followed by `unreachable`.    - **Details:** Introduce indirect calls within `br_table` that can lead to `unreachable` paths if indices are mishandled.

(assert_invalid
  (module (func $type-br_table-indirect-call-unreachable
    (block (br_table 0 (unreachable) (call_indirect (type 0) (local.get 0))))
  ))
  "type mismatch"
)