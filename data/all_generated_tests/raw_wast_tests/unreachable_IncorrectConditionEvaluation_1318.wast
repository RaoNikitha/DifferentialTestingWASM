;; Develop a sequence of `select` instructions using various conditions. Insert `unreachable` in the selected path for incorrect condition evaluations, causing unexpected traps when conditions are mishandled.

(assert_invalid
  (module (func $differential_select_unreachable
    (select (i32.const 0) (i32.const 1) (unreachable))
  ))
  "type mismatch"
)