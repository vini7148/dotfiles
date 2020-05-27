#include <iostream>
#include <vector>
#include <string>
#include <math.h>
#include <algorithm>
#include <set>
#include <iterator>

#define ll long long

using namespace std;

int main()
{
    ll n, k;
    cin >> n >> k;
    ll s[n], d[n];
    for(ll i = 0; i < n; i++)
        cin >> s[i];

    for(ll i = 0; i < n; i++)
        cin >> d[i];

    pair<double,ll> ratio[n];
    
    for(ll i = 0; i < n; i++)
    {
        ratio[i].first = ((1.0) * d[i] / s[i]);
        ratio[i].second = s[i];
    }
   
    sort(ratio, ratio + n);

    multiset<ll> set;
    
    ll sum = 0;
    
    for(ll i = 0; i < k; i++)
    {
        sum += ratio[i].second;
        set.insert(ratio[i].second);  
    }
    
    double val = (double)sum * ratio[k - 1].first;
    
    // cout << val << " " << sum << endl;
    
    for(ll i = k; i < n; i++)
    {
        // cout << *set.rbegin() << " start val" << endl;
        if(ratio[i].second < *set.rbegin())
        {
            // cout << i << " in if " << val << " " << sum << endl;
            sum = sum + (ratio[i].second - *set.rbegin());
            
            // cout << ratio[i].second << " " << *set.rbegin() << endl;
            // cout << i << " in if " << val << " " << sum << endl;
            
            auto e = set.rbegin();
            set.erase((++e).base());
            set.insert(ratio[i].second);
            
            val = min(val,sum*ratio[i].first);           
        }
        // cout << i << " " << val << " " << sum << endl;
    }
    cout << ceil(val) << endl;
}