;; 3. Test for a `br_if` branch with a dynamic condition (result of an arithmetic operation) followed by `unreachable`. Check if the branch is taken based on evaluation. Constraint: Tests dynamic condition evaluation for branching. Example: `(i32.const 2) (i32.const 2) (i32.mul) (br_if 0 (unreachable))`

(assert_invalid
  (module (func $dynamic-condition-br-if-followed-by-unreachable
    (i32.const 2) (i32.const 2) (i32.mul) (br_if 0 (unreachable))
  ))
  "type mismatch"
)