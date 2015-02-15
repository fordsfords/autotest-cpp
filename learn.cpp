/* learn.cpp */

#include <iostream>
using namespace std;  // Can use cout instead of std::cout

#include "gtest/gtest.h"

TEST(CoutTests, Simple) {
  EXPECT_NO_THROW(std::cout << "Hello world\n");
  ASSERT_NO_THROW(cout << "msg2\n");               // using namespace std;
}  // CoutTests, Simple

TEST(VarInits, Simple) {
  double d1 = 1.2;  ASSERT_EQ(d1, 1.2);
  double d2 {3.4};  ASSERT_EQ(d2, 3.4);
  double d3 {5};  ASSERT_EQ(d3, 5.0);
  /* int i1 = 1.2;  // generates warning */
  /* int i2 {3.4};  // generates error */
}  // VarInits, Simple
