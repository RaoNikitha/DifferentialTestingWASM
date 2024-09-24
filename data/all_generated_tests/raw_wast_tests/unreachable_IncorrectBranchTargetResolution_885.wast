;; 6. **Test Unreachable Before Exiting Block with Br-If:**    - Use `unreachable` just before a block end and conditionally branch (`br_if`) to an outer block.    - *Constraint*: Checks if the conditionally branching respects the `unreachable` trap and correctly resolves to the outer block.    - *Relation to Branch Resolution*: Tests labels related to conditional branches and `unreachable`.

(assert_invalid
  (module (func $test-unreachable-before-br-if
    (block $outer
      (block
        unreachable
        (br_if $outer (i32.const 1))
      )
    )
  ))
  "unreachable executed"
)