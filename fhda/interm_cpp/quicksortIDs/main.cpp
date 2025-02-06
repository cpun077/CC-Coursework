#include <string>
#include <vector>
#include <iostream>

using namespace std;

// TODO: Write the partitioning algorithm - pick the middle element as the
//       pivot, compare the values using two index variables l and h (low and high),
//       initialized to the left and right sides of the current elements being sorted,
//       and determine if a swap is necessary
int Partition(vector<string> &userIDs, int i, int k) {
   // create pivot and swap it with the rightmost element
   int pidx = i + (k-i)/2;
   string pivot = userIDs[pidx];
   swap(userIDs[pidx], userIDs[k]);
   
   int l = k-1; // low from the right
   int h = i; // high from the left
   while (l >= h) {
      while (l >= h && userIDs[l] >= pivot) { // find element less than pivot from the right
         l--;
      } 
      while (l >= h && userIDs[h] <= pivot) { // find element greater than pivot from the left
         h++;
      } 
      if (l > h) { // swap if both are found
         swap(userIDs[l], userIDs[h]);
         l--;
         h++;
      }
   }

   // swap pivot if high idx > low idx
   swap(userIDs[k], userIDs[h]);
   return h; // return new idx of pivot
}

// TODO: Write the quicksort algorithm that recursively sorts the low and
//       high partitions
void Quicksort(vector<string> &userIDs, int i, int k) {
   if (i < k) {
      int p = Partition(userIDs, i, k);
      Quicksort(userIDs, i, p-1);
      Quicksort(userIDs, p+1, k);
   }
}

int main() {
   vector<string> userIDList;
   string userID;

   cin >> userID;
   while (userID != "-1") {
      userIDList.push_back(userID);
      cin >> userID;
   }

   // Initial call to quicksort
   Quicksort(userIDList, 0, userIDList.size() - 1);

   for (size_t i = 0; i < userIDList.size(); ++i) {
      cout << userIDList.at(i) << endl;;
   }

   return 0;
}